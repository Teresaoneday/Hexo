<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io"  target="_blank">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next" target="_blank">
    NexT.{{ theme.scheme }}
  </a>
</div>
<link href="{{ url_for(theme.css) }}/important.css" rel="stylesheet" type="text/css" />
<link href="{{ url_for(theme.css) }}/search.css" rel="stylesheet" type="text/css" />
<link href="{{ url_for(theme.music) }}/css/music-hub.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="{{ url_for(theme.js) }}/search.js"></script>
<script type="text/javascript" src="{{ url_for(theme.js) }}/important.js"></script>
<script src="{{ url_for(theme.music) }}/js/music-hub.js"></script>
<script src="{{ url_for(theme.music) }}/js/music-hub-config.js"></script>

{% block footer %}{% endblock %}
