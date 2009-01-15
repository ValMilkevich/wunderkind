module ValidationsHelper
  EMAIL_PATTERN = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9_]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/
  PHONE_PATTERN = /(^[0-9\-\+ ]{4,}$)||(^$)/
  ABLE_PATTERN  = /^[A-Za-z]+$/
  #
  DISALLOWED_EMAIL_HOSTS = %w(mailinator.com mailinator.org)
  #

  #validates if given attributes are syntactically valid emails
  #
  #- last parameter can be a hash with options
  #
  #   - :allow_all_hosts indicates if every host is allowed. if false then its checked
  #
  #     against the list DISALLOWED_EMAIL_HOSTS and returns fals if the email is
  #
  #     from one of those. default = false
  #


  #validating captcha
  def validates_captcha(*attrs)
    config = {:message => ' is invalid', :on => :save}
    config.update(attrs.pop) if attrs.last.is_a?(Hash)
    validates_each(attrs, config) do |record, attr, value|
      unless config[:if] and not evaluate_condition(config[:if], record)
        if(!value||Captcha.find(value.to_i).answer.to_s!=record.captcha_answer.to_s.strip)    
          record.errors.add('captcha','ответ на вопрос был неверен, попробуйте ещё раз') 
        end
      end
    end
  end 
  
  
  def validates_polymorphic_type(*attrs)
    config = {:message => 'is not a valid polymorphic type', :on => :save}
    config.update(attrs.pop) if attrs.last.is_a?(Hash)
    validates_each(attrs, config) do |record, attr, value|
      unless config[:if] and not evaluate_condition(config[:if], record)
        #do every check only if there was no error yet...
        error = false        
        error = record.errors.add(attr, config[:message]) unless not error and value =~ ABLE_PATTERN        
      end
    end
  end
  
  def validates_email(*attrs)
    config = {:message => 'is not correct', :on => :save, :allow_all_hosts => false}
    config.update(attrs.pop) if attrs.last.is_a?(Hash)
    validates_each(attrs, config) do |record, attr, value|
      unless config[:if] and not evaluate_condition(config[:if], record)
        #do every check only if there was no error yet...
        error = false        
        error = record.errors.add(attr, 'должен быть правильным, smbd@smth.smw') unless not error and value =~ EMAIL_PATTERN        
        error = record.errors.add(attr, 'email адреса с данного адреса блокируются системой') if not config[:allow_all_hosts] and not error and DISALLOWED_EMAIL_HOSTS.include?(value.split("@", 2)[1].strip.downcase)
      end
    end
  end
  
  def validates_phone(*attrs)
    config = {:message => 'is not a valid phone number', :on => :save}
    config.update(attrs.pop) if attrs.last.is_a?(Hash)
    validates_each(attrs, config) do |record, attr, value|
      if(value)
        unless config[:if] and not evaluate_condition(config[:if], record)
          #do every check only if there was no error yet...
          error = false        
          error = record.errors.add(attr, config[:message]) unless not error and value =~ PHONE_PATTERN       
        end
      end
    end
  end
  
end

