import { Controller, Get, Param } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

 
  @Get(":name")
  sayHelloTo(@Param("name") name): string {
    return `${name} bobo`;
  }
}
