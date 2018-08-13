<div class="row">
	<div class="col-lg-12">
		<h1><i class="fas fa-user-plus"></i> Sign Up</h1>
		<hr>
		<p>Here you can create your account.</p>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		{{ content() }}
	</div>
</div>

{{ form('class': 'form-search') }}
	<div class="row">
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">{{ form.label('name') }}</span>
				</div>
				{{ form.render('name') }}
			</div>
		</div>
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">{{ form.label('email') }}</span>
				</div>
				{{ form.render('email') }}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">{{ form.label('password') }}</span>
				</div>
				{{ form.render('password') }}
			</div>
		</div>
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">{{ form.label('confirmPassword') }}</span>
				</div>
				{{ form.render('confirmPassword') }}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">{{ form.render('terms') }}</span>
				</div>
				<p class="form-control">{{ form.label('terms') }}</p>
			</div>
		</div>
		<div class="col-lg-6">
			{{ form.render('Sign Up') }}
		</div>
	</div>
</form>
