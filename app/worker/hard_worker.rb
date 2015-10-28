class HardWorker
	include Sidekiq::Worker
	def perform(mesg)
	  #do something
	end
end
