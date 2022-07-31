import 'reflect-metadata';
import { faker } from '@faker-js/faker';
import { log } from 'console';
import chalk from 'chalk';
import { randomInt } from 'crypto';
import EventEmitter2 from 'eventemitter2';

console.clear();
console.log('\n\n');

const emitter = new EventEmitter2();

emitter.on('data', (data: any) => {
  console.log(chalk.yellow('@Data'), data);
});

function Dec(value: any) {
  return function (
    target: Object,
    key: string | symbol,
    descriptor: PropertyDescriptor,
  ) {
    console.log(key, value);
    Reflect.defineProperty(target, key, descriptor);
    log('target', target);
    log('key', key);
    log('descriptor', descriptor);

    const original = descriptor.value;

    descriptor.value = function (...args: any[]) {
      emitter.emit('data', ...args);

      return Reflect.apply(original, this, args);
    };

    return descriptor;
  };
}

class People {
  @Dec({
    queueUrl: 'http://localhost:4566/000000000000/debug',
  })
  sendMessage(message: any) {
    console.log(chalk.cyan('@Message'), message);

    return {
      id: randomInt(0, 100),
      message: 'Hello World!',
    };
  }
}

const run = async () => {
  const people = new People();
  people.sendMessage({ message: faker.name.firstName() });

  const res = people.sendMessage({ message: faker.name.firstName() });
  console.log(res);

  console.log('\n');
};
run();
