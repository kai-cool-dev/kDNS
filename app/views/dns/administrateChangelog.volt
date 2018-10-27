<div class="row">
  <div class="col-lg-12">
    <h1><i class="far fa-file-alt"></i> Changelog</h1>
    <hr>
    <p>This is the changelog of the operations in the domain management.</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

{% for changelog in changelog %}
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">#{{ changelog.id }} - {{ changelog.type }} - {{ changelog.date }}</h5>
          <div class="row">
            {% for name, value in changelog.data %}
              <div class="col-lg-3">
                <p>{{ name }}: {{ value }}</p>
              </div>
            {% endfor %}
          </div>
          <p>Done by {{ link_to('users/edit/' ~ changelog.uid.id, changelog.uid.name) }}</p>
        </div>
      </div>
    </div>
  </div>
{% else %}
  <div class="row">
    <div class="col-lg-12">
      <h2>No Log created.</h2>
    </div>
  </div>
{% endfor %}
