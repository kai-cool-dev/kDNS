<div class="row">
	<div class="col-lg-12">
		{{ content() }}
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<h1>Login</h1>
	</div>
</div>

{{ form('class': 'form-search') }}
	{{ form.render('csrf', ['value': security.getToken()]) }}
	<div class="row">
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">E-Mail</span>
				</div>
				{{ form.render('email') }}
			</div>
		</div>
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">Password</span>
				</div>
				{{ form.render('password') }}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3">
			<div class="input-group">
				<div class="input-group-prepend">
					<div class="input-group-text">
						{{ form.render('remember') }}
					</div>
				</div>
				<p class="form-control">{{ form.label('remember') }}</p>
			</div>
		</div>
		<div class="col-lg-3">
			{{ link_to("session/forgotPassword", "Forgot my password", 'class':'form-control btn btn-light') }}
		</div>
		<div class="col-lg-6">
			{{ form.render('go') }}
		</div>
	</div>
</form>
