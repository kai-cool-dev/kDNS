<div class="row">
  <div class="col-lg-12">
    {% if name %}
      <h1>Search for "{{ name }}"</h1>
    {% else %}
      <h1>Domain search</h1>
    {% endif %}
    <hr>
    <p>Here you can search for your domain. The search is not case sensitive. It is fulltext search, but you can't use regex jet.</p>
    {% if identity["profile"] == "Administrators" %}
      <p>As administrator, you can search for any domain in the database. But if a zone is not from you, you see a notification.<br>
        Use your power wise!</p>
    {% endif %}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<form method="get">
  <div class="row">
    <div class="col-lg-10">
      {{ form.render('name') }}
    </div>
    <div class="col-lg-2">
      <button class="form-control btn btn-success">Search</button>
    </div>
  </div>
</form>

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
    {{ link_to("dns/search" ~ "&name=" ~ name, 'First', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/search?page=" ~ domains.before ~ "&name=" ~ name, 'Previous', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-4">
    <p class="form-control">{{ domains.current }}/{{ domains.total_pages }}</p>
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/search?page=" ~ domains.next ~ "&name=" ~ name, 'Next', "class": "btn btn-primary form-control") }}
  </div>
  <div class="col-lg-2">
    {{ link_to("dns/search?page=" ~ domains.last ~ "&name=" ~ name, 'Last', "class": "btn btn-primary form-control") }}
  </div>
</div>
