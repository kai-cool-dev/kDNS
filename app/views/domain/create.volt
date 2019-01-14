<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-plus"></i> Create new Domain</h1>
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
            <div class="col-lg-10">
              {{ form.render('name') }}
            </div>
            <div class="col-lg-2">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">.</span>
                </div>
                {{ form.render('tld') }}
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              {{ form.render('description') }}
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <button type="submit" class="form-control btn btn-primary"><i class="fas fa-plus"></i> Create Domain</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
