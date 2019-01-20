<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
					<div class="col-lg-12">
						<h1><i class="far fa-file-alt"></i> Show Changelog <b>#{{ changelog.id }}</b></h1>
						<hr>
					</div>
				</div>
        <div class="row">
					<div class="col-lg-12">
						{{ content() }}
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
            <h2><i class="fas fa-user"></i> User Information</h2>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <p>Name:</p>
          </div>
          <div class="col-lg-6">
            <p>{{ changelog.uid.name }}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <p>E-Mail:</p>
          </div>
          <div class="col-lg-6">
            <p>{{ changelog.uid.email }}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <p>{{ link_to("user/edit/" ~ changelog.uid.id ~ '/', '<i class="fas fa-search"></i> Show', "class": "btn btn-primary form-control") }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-6">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h2><i class="fas fa-align-justify"></i> Method</h2>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <p><i class="far fa-clock"></i> Change Date:</p>
          </div>
          <div class="col-lg-6">
            <p>{{ changelog.date }}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <p><i class="fas fa-play"></i> Action:</p>
          </div>
          <div class="col-lg-6">
            <p>{{ changelog.type }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h2><i class="fas fa-align-justify"></i> Data</h2>
            <hr>
          </div>
        </div>
        {% for resource, actions in changelog.data %}
          <div class="row">
            <div class="col-lg-6">
              <p>{{ resource }}</p>
            </div>
            <div class="col-lg-6">
              <p>{{ actions }}</p>
            </div>
          </div>
        {% endfor %}
      </div>
    </div>
  </div>
</div>
