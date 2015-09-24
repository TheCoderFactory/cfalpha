class ReminderMailerJob 
  include SuckerPunch::Job
  include FistOfFury::Recurrent
  
  def perform
    raise NotImplementedError
  end
end
