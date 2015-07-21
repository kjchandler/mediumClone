module FlashHelper
	def flash_notices!
		return "" if !alert && !notice

		flashes = ""

		alertHtml = <<-HTML
			<div class="alert alert-danger">
				#{alert}
			</div>
		HTML

		flashes += alertHtml if alert
		flashes += noticeHtml if notice

		html = <<-HTML
		<div class="row">
			<div class="col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-3">
				#{flashes}
			</div>
		</div>
		HTML

		html.html_safe
	end
end