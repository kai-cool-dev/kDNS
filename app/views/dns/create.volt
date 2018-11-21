<div class="row">
  <div class="col-lg-12">
    <h1>Create new Domain</h1>
    <hr>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<form method="post" autocomplete="off">
  <div class="row">
    <div class="col-lg-9">
      {{ form.render('name') }}
    </div>
    <div class="col-lg-1">
      <p class="form-control">.</p>
    </div>
    <div class="col-lg-2">
      {{ form.render('tld') }}
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      {{ form.render('description') }}
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <button type="submit" class="form-control btn btn-primary">Create Domain</button>
    </div>
  </div>
</form>