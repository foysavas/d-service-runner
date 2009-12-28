template ServiceRunner(T) {
  mixin ServiceRunnerHooks;
  mixin ServiceRunnerMain!(T);
}

template ServiceRunnerHooks() {
  extern (C) void function(int) signal(int signal, void function(int) handler);

  extern (C) void sighandler(int sig) {
    writeln("\nStopping service...");
    terminate();
  }
}

template ServiceRunnerMain(T) {
  import core.memory;

  import std.c.stdlib;
  version (linux) import std.c.linux.linux;

  import std.stdio;

  void terminate() {
    service.stop();
    GC.collect();
    writeln("Safely stopped.");
    exit(0);
  }

  T service;

  int main(char[][] args) {
    signal(SIGABRT, &sighandler);
    signal(SIGTERM, &sighandler);
    signal(SIGQUIT, &sighandler);
    signal(SIGINT, &sighandler); 

    service = new T(args);
    service.start();

    return 0;
  }

}
