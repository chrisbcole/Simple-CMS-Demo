class DemoController < ApplicationController

  layout 'admin'  

  def index
  	# render('hello')
  	# redirect_to(:action => 'other_hello')
  end
  
  def hello
  	@array = [1,2,3,4,5]
  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	render(:text => "oh hai there")
  end

  def javascript
  end

  def text_helpers
  end

  def escape_output
    
  end

  def make_error
    render(:text => 'test') # syntax error
    # render(:text => @something.upcase) # undefined method on nil
    # render(:text => "1" + 1) # can't convert type
  end

  def logging
    @subjects = Subject.all
    ActiveSupport::Deprecation.warn("This is a deprecation")
    logger.debug("this is debug")
    logger.info("this is info")
    logger.warn("this is warn")
    logger.error("this is error")
    logger.fatal("this is fatal")
    render(:text => "Logged!")
  end

end