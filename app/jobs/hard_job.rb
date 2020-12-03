class HardJob < ApplicationJob
  class_timeout 300 # 300s or 5m, current Lambda max is 15m

  #rate "10 hours" # every 10 hours
  iam_policy "lambda" # adds IAM permission/access
  def dig
    Post.create(
      title: Time.now.to_s(:db)
    )
  end

  # Cron expression is AWS Cron Format and require 6 fields
  #cron "0 */12 * * ? *" # every 12 hours
  #def lift
  #  puts "done lifting"
  #end
end