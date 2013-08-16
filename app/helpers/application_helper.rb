module ApplicationHelper

	def conditional_class(*args)
		conditional = args.extract_options!
		classes_array = []
		classes_array = args[0].split(' ') if not args.empty?
		conditional_array = conditional.reject{ |key, value| not value }.map{ |key, value| key.to_s }
		{ :class => (classes_array + conditional_array).join(' ') }
	end
end
