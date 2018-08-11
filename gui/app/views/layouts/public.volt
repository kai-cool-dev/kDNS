<nav class="navbar navbar-expand-lg navbar-light bg-light">
  {{ link_to(null, 'class': 'navbar-brand', 'kDNS GUI')}}
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      {%- set menus = [
        '<i class="fas fa-home"></i> Home': 'index',
        '<i class="fas fa-users"></i> About': 'about'
      ] -%}

      {%- for key, value in menus %}
        {% if value == dispatcher.getControllerName() %}
        <li class="nav-item active">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% else %}
        <li class="nav-item">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% endif %}
      {%- endfor -%}
    </ul>
    {%- if logged_in is defined and not(logged_in is empty) -%}
    <ul class="navbar-nav mr-r4">
      <li class="nav-item">{{ link_to('dns', 'DNS Management', 'class':'nav-link') }}</li>
      <li class="nav-item">{{ link_to('session/logout', 'Logout', 'class':'nav-link') }}</li>
    </ul>
    {% else %}
    <ul class="navbar-nav mr-r2">
      <li class="nav-item">
        {{ link_to('session/login', '<i class="fas fa-sign-in-alt"></i> Login', 'class':'nav-link') }}
      </li>
    </ul>
    {% endif %}
  </div>
</nav>

<div class="container-fluid main-container">
  {{ content() }}
</div>

<footer>
Made with <3 in Germany
{{ link_to("privacy", "Privacy Policy") }}
{{ link_to("terms", "Terms") }}
© {{ date("Y") }} Kai Pazdzewicz.
</footer>
