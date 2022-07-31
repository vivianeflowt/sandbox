import chalk from 'chalk';
import EventEmitter2, { eventNS, ListenerFn, OnOptions } from 'eventemitter2';

export class Core {
  emitter: EventEmitter2;

  constructor() {
    this.emitter = new EventEmitter2();

    this.emitter.on('data', (data: any) => {
      console.log(chalk.yellow('@Data'), data);
    });
  }

  on(event: string, listener: ListenerFn, options?: boolean | OnOptions) {
    this.emitter.on(event, listener);
  }
}
