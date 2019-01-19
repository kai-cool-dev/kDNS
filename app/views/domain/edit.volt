<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1>Details for {{ link_to('domain/edit/' ~ domain.id,domain.name) }}</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <p>Created at {{ domain.created }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h5>Description of your Domain</h5>
            <p>This will also be shown on the whois page and over our internal whois system, but this will not apply to public domains.</p>
          </div>
        </div>
        <form method="post" action="{{ url('domain/updateDescription/' ~ domain.id) }}">
          <div class="row">
            <div class="col-lg-12">
              {{ descriptionform.render('description') }}
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <button type="submit" name="action" value="updateDescription" class="btn form-control btn-success" data-toggle="tooltip" data-placement="bottom" title="Save the domain description"><i class="fas fa-save"></i> Save Description</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-6">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h5>Actions for your Domain</h5>
            <p>Here you can access several actions for your domain. You can delete it or get whois information.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ link_to('record/edit/' ~ domain.id,'<i class="fas fa-edit"></i> Edit DNS Records','class':'btn btn-primary form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Edit your DNS Records') }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            {{ link_to('domain/delete/' ~ domain.id,'<i class="fas fa-trash"></i> Delete Domain','class':'btn btn-danger form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Delete Domain') }}
          </div>
          <div class="col-lg-6">
            <form method="post" action="{{ url('whois/index/') }}">
              <button type="submit" name="name" value="{{ domain.name }}" class="btn form-control btn-primary" data-toggle="tooltip" data-placement="bottom" title="See whois information"><i class="fas fa-question"></i> Whois</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
