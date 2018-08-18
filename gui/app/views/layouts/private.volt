<nav class="navbar navbar-expand-lg navbar-light bg-primary">
  {{ link_to(null, 'class': 'navbar-brand', 'Peppermint.Cloud DNS')}}
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      {%- set menus = [
        '<i class="fas fa-home"></i> Home': 'dns',
        '<i class="fas fa-search"></i> List/Search Domains': 'dns/search',
        '<i class="fas fa-plus"></i> Create new Domain': 'dns/create'
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
        '<i class="fas fa-user-shield"></i> Permissions': 'permissions',
        '<i class="fas fa-users-cog"></i> Profiles': 'profiles',
        '<i class="fas fa-user-edit"></i> Users': 'users'
      ] -%}

      {%- for key, value in menus %}
        {% if value == dispatcher.getControllerName() %}
        <li class="nav-item active">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% else %}
        <li class="nav-item">{{ link_to(value, key, 'class':'nav-link') }}</li>
        {% endif %}
      {%- endfor -%}
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-server"></i> DNS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          {{ link_to('dns/administrateTLD','<i class="fas fa-wrench"></i> Manage Top Level Domains', 'class': 'dropdown-item') }}
          {{ link_to('dns/administrateNS','<i class="fas fa-wrench"></i> Manage authorative Nameserver', 'class': 'dropdown-item') }}
          {{ link_to('dns/administrateRecursor','<i class="fas fa-wrench"></i> Manage recursor Nameserver', 'class': 'dropdown-item') }}
          {{ link_to('dns/administrateType','<i class="fas fa-wrench"></i> Manage Record Types', 'class': 'dropdown-item') }}
          {{ link_to('dns/administrateChangelog','<i class="far fa-file-alt"></i> Changelog', 'class': 'dropdown-item') }}
        </div>
      </li>
    </ul>
    {% endif %}
    <ul class="navbar-nav mr-r4">
      <li class="nav-item">{{ link_to('users/changePassword', '<i class="fas fa-user-edit"></i> Change your Password', 'class':'nav-link') }}</li>
      <li class="nav-item">{{ link_to('session/logout', '<i class="fas fa-sign-out-alt"></i> Logout', 'class':'nav-link') }}</li>
    </ul>
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
