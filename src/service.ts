import net from 'net';
import EventEmitter2 from 'eventemitter2';
import { log } from 'console';

const PORT = process.env.PORT || 3333;

export default class Service extends EventEmitter2 {
  server: net.Server;

  constructor() {
    super({
      wildcard: true,
      maxListeners: 100,
    });

    this.server = net.createServer();

    this.server.on('connection', (socket) => {
      socket.on('data', (data) => {
        const message = JSON.parse(data.toString());
        log('message', message.event);
        log('       ', message.data);
        this.emit(message.event, message.data);
      });

      socket.emit('\x00', {
        message: 'hello',
        data: 'world',
      });

      setInterval(() => {
        socket.write(
          JSON.stringify({
            event: '\x00',
            data: 'zero',
          }),
        );
      }, 2000);
    });

    this.on('*', (event, data) => {
      this.server.emit(event, data);
    });
  }

  close() {
    this.server.close();
  }

  open() {
    this.server.listen(PORT);
  }
}

const service = new Service();

service.open();
