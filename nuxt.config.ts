export default defineNuxtConfig({
    compatibilityDate: '2024-11-01',
    devtools: { 
        enabled: true 
    },
    modules: [
        '@nuxt/ui', 
        '@nuxthub/core'
    ],
    hub: {
        database: true 
    },
    $development: {
        hub: {
            remote: true
        }
    },
    css: [
        '~/assets/main.css'
    ]
})
