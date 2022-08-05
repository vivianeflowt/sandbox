import Net from 'net';
import EventEmitter2 from 'eventemitter2';
import { log } from 'console';

const PORT = +process.env.PORT || 3333;

export default class Node extends EventEmitter2 {
  client: Net.Socket;

  constructor() {
    super({
      wildcard: true,
      maxListeners: 100,
    });

    this.client = new Net.Socket();
  }

  close() {
    this.client.end();
  }

  handleMessage(message: any) {
    log('message', message.event);
    log('       ', message.data);
    this.emit('\x00', 'zero');
  }

  open() {
    this.client.connect(PORT, () => {
      log('connected');

      this.client.emit('\x00', {
        message: 'hello',
        data: 'world',
      });

      this.client.on('data', this.handleMessage.bind(this));
    });
  }
}

const node = new Node();

node.open();
