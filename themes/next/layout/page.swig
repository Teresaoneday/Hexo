{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}
{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" %}
    {{ __('title.category') + page_title_suffix }}
  {% elif page.type === "tags" %}
    {{ __('title.tag') + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
    {# tagcloud page support #}
    {% if page.type === "tags" %}
      <div class="tag-cloud">
        <div class="tag-cloud-title">
            {{ _p('counter.tag_cloud', site.tags.length) }}
        </div>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
      </div>
    {% elif page.type === 'categories' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    {% else %}
      {{ page.content }}
      <blockquote class="blockquote-center leave-message">给我留言吧！请在 <a href="https://github.com/niices/niices.github.io/issues/1" target="_blank">此Github issue</a> 页面完成操作_(:з」∠)_</blockquote>
      <div id="ghComment"></div>
      <link href="{{ url_for(theme.css) }}/music-hub.css" rel="stylesheet" type="text/css" />
      <div id="music_hub_content"></div>
      <script type="text/javascript" src="{{ url_for(theme.js) }}/music-hub.js"></script>
      <script type="text/javascript" src="{{ url_for(theme.js) }}/music-hub-config.js"></script>
      <script type="text/javascript" src="{{ url_for(theme.js) }}/comment.js"></script>
    {% endif %}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}


