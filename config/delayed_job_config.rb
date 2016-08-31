Delayed::Worker.sleep_delay = 10
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 1.minutes
Delayed::Worker.read_ahead = 5
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.delay_jobs = !Rails.env.test?
Delayed::Worker.raise_signal_exceptions = :term
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))