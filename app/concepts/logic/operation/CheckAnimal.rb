module Logic::Operation

  class StoneExceptionHandler
    def self.call(exception, (ctx), *)
    ctx[:exception_class] = exception.class
    end
  end

  class CheckAnimal < Trailblazer::Activity::Railway
    Found = Class.new(Trailblazer::Activity::Signal)
    ExceptionSignal = Class.new(Trailblazer::Activity::Signal)

    step :check_cow, Output(Found, :found) => End(:found)
    step :check_dog, Output(Found, :found) => End(:found)

    step Rescue( Exception, handler: StoneExceptionHandler ) {
      step :check_stone, Output(ExceptionSignal, :found) => End(:exception)
    }
    fail :silence

    def silence(ctx, params:, **)
      ctx[:sound] = '--silence--'
    end

    def check_cow(ctx, params:, **)
      if params['this'] == 'cow'
        ctx[:sound] = 'Moo'
        return Found
      end
      true
    end

    def check_dog(ctx, params:, **)
      if params['this'] == 'dog'
        ctx[:sound] = params['that'].upcase
        return Found
      end
      true
    end

    def check_stone(ctx, params:, **)
      if params['this'] == 'stone'
        throw Exception.new
      end
      true
    end

  end
end