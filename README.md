# D Service Runner

_I almost called this one ActsAsService_

## Your Problem

You've got a service that uses a bunch of resources (memory, ports, et cetera), but when that service gets killed (by `ctrl-c` or the like), those resources aren't guaranteed to be free.

## Your Answer

No need to write up a custom `main` function. Instead just import this code and use the `ServiceRunner` mixin.

## Show Me The Magic

    class AnnoyingService {
      //you'll need a constructor that handles
      // the args from main (even a noop will do)
      this(char[][] args) {}

      // you'll also need a start method
      // likely where resources are consumed
      void start() {
        for(;;) {
          writeln("are we there yet?");
        }
      }

      // finally, this is where you can d-stroy stuff
      void stop() {}
    }

    // now with just a couple lines you're rocking!
    import service_runner;
    mixin ServiceRunner!(AnnoyingService);
