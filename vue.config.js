const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  publicPath: process.env.NODE_ENV === 'production' ? '/masha-and-bear/' : '/',
  transpileDependencies: true,
  css: {
    loaderOptions: {
      scss: {
        additionalData: `
          @import "@/assets/styles/base/_vars.scss";
          @import "@/assets/styles/base/_mixins.scss";
        `,
      },
    },
  },
})
