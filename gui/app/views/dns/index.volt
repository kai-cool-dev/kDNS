<div class="row">
  <div class="col-lg-12">
    <h1>Welcome to kDNS</h1>
    <hr>
    <p>Here are your domains listed. If you don't have any. Just create one!</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <table class="table table-striped table-borderless">
      {% for domain in domains.items %}
        {% if loop.first %}
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Name</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
        {% endif %}
          <tr>
            <th scope="row">#{{ domain.id }}</th>
            <td>{{ domain.name }}</td>
            <td>{{ link_to('dns/edit/' ~ domain.id,'Edit','class':'btn btn-primary form-control') }}</td>
          </tr>
        {% else %}
          <tr>
            <td colspan="2">You don't have any domains.</td>
            <td>{{ link_to('dns/create','Create one!','class':'btn btn-primary form-control') }}</td>
          </tr>
        {% endfor %}
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="col-lg-2">
    {{ link_to("dns/index", 'First', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.before, 'Previous', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-4">
    <p class="form-control">{{ domains.current }}/{{ domains.total_pages }}</p>
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.next, 'Next', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/index?page=" ~ domains.last, 'Last', "class": "btn btn-primary form-control") }}
  </div>
</div>
