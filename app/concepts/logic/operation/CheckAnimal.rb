module Logic::Operation

  class StoneExceptionHandler
    def self.call(exception, (ctx), *)
    ctx[:exception_class] = exception.class
    end
  end

  class CheckAnimal < Trailblazer::Activity::Railway
    Found = Class.new(Trailblazer::Activity::Signal)
    Extinct = Class.new(Trailblazer::Activity::Signal)
    ExceptionSignal = Class.new(Trailblazer::Activity::Signal)

    # Three paths:
    # found -> sound
    # failure -> silence
    # success -> sound if
    #
    # + exception handler
    step :check_cow, Output(Found, :found) => End(:found)
    step :check_dog, Output(Found, :found) => End(:found)
    # No bat task at all...
    step :check_rex, Output(Extinct, :found) => End(:found)

    step Rescue( Exception, handler: StoneExceptionHandler ) {
      step :check_stone
    }

    step :check_if_found
    fail :silence

    def silence(ctx, params:, **)
      ctx[:sound] = '--silence--'
    end

    def check_cow(ctx, params:, **)
      if params['this'] == 'cow'
        ctx[:sound] = 'Moo'
        return Found
      end
      true # nothing unexpected happened...
    end

    def check_dog(ctx, params:, **)
      if params['this'] == 'dog'
        ctx[:sound] = params['that'].upcase
        return Found
      end
      true # nothing unexpected happened...
    end

    def check_rex(ctx, params:, **)
      if params['this'] == 'rex'
        ctx[:sound] = params['that'].upcase
        return Extinct
      end
      true # nothing unexpected happened...
    end

    def check_if_found(ctx, params:, **)
      false # if not in 'Found' path, we failed...
    end

    def check_stone(ctx, params:, **)
      if params['this'] == 'stone'
        throw Exception.new
      end
      true # nothing unexpected happened...
    end

  end
end