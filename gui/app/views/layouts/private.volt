<nav class="navbar navbar-expand-lg navbar-light bg-light">
  {{ link_to(null, 'class': 'navbar-brand', 'kDNS GUI')}}
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      {%- set menus = [
        'Home': 'dns',
        'List/Search Domains': 'dns/search',
        'Create new Domain': 'dns/create'
      ] -%}

      {%- for key, value in menus %}
        {% if value == dispatcher.getControllerName() %}
        <li class="nav-item active">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% else %}
        <li class="nav-item">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% endif %}
      {%- endfor -%}
    </ul>
    {% if identity["profile"] == "Administrators" %}
    <ul class="navbar-nav mr-auto">
      {%- set menus = [
        'Permissions': 'permissions',
        'Profiles': 'profiles',
        'User Administration': 'users'
      ] -%}

      {%- for key, value in menus %}
        {% if value == dispatcher.getControllerName() %}
        <li class="nav-item active">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% else %}
        <li class="nav-item">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% endif %}
      {%- endfor -%}
    </ul>
    {% endif %}
    <ul class="navbar-nav mr-r4">
      <li class="nav-item">{{ link_to('users/changePassword', 'Change your password', 'class':'nav-link') }}</li>
      <li class="nav-item">{{ link_to('session/logout', 'Logout', 'class':'nav-link') }}</li>
    </ul>
  </div>
</nav>

<div class="container main-container">
  {{ content() }}
</div>

<footer>
Made with <3 in Germany
{{ link_to("privacy", "Privacy Policy") }}
{{ link_to("terms", "Terms") }}
© {{ date("Y") }} Kai Pazdzewicz.
</footer>
