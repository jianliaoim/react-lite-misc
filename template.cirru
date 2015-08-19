var
  stir $ require :stir-template

var
  ({}~ html head title body meta script link div a span) stir

var
  line $ \ (text) (div ({} (:className :line)) text)

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null ":React Lite Misc"
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :http://tp4.sinaimg.cn/5592259015/180/5725970590/1
        cond (not data.dev)
          link $ {} (:rel :stylesheet)
            :href data.style
          , undefined
        script $ object (:src data.vendor) (:defer true)
        script $ object (:src data.main) (:defer true)
      body null
        div ({} (:class :intro))
          div ({} (:class :title)) ":Misc Components of jianliao.com."
          div null
            span null ":Read more at "
            a
              {} (:href :http://github.com/teambition/react-lite-misc)
              , :github.com/teambition/react-lite-misc
            span null :.
        div ({} (:id :example))
