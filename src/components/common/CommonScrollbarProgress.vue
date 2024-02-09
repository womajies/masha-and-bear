<template>
  <div class="scrollbar-progress">
    <div :style="`width: ${scrollPercent}%`" class="scrollbar-progress__state" />
  </div>
</template>

<script>
export default {
  name: 'CommonScrollbarProgress',

  data() {
    return {
      scrollPercent: 0
    }
  },

  mounted() {
    window.addEventListener('scroll', this.handleScroll);
  },

  methods: {
    handleScroll() {
      const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
      const clientHeight = document.documentElement.clientHeight;
      const scrollHeight = document.documentElement.scrollHeight;
      const currentScrollPercent = (scrollPosition / (scrollHeight - clientHeight) * 100).toFixed(0);

      this.scrollPercent = currentScrollPercent;
    }
  },

  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  }
}
</script>

<style lang="scss" scoped>
.scrollbar-progress {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 0;
  width: 100%;
  z-index: 15;
  border-bottom: 4px transparent solid;

  &__state {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 2;
    border-top: 4px $scroll-progress-color solid;
    transition: width $transition-duration linear;
  }
}

</style>
