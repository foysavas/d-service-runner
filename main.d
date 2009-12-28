class Service {
  // you can use the main args here if you need
  this(char[][] args) {}

  // stub for start up code
  void start() {
    for(;;) {
      writeln("are we there yet?");
    }
  }

  // this be where you d-stroy stuff
  void stop() {}
}


import service_runner;
mixin ServiceRunner!(Service);
