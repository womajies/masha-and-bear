
import UIconVue from '../ui/UIcon.vue';
<template>
  <transition name="fade">
    <header v-if="showHeader" class="header container">
      <UButton icon="arrow-left" variant="primary" aria-label="Back" title="Back" />
      <a href="/" class="header__logo" aria-label="Логотип Logoipsum">
        <UIcon name="logo" width="166" height="30" />
      </a>
      <UButton icon="person" variant="primary" aria-label="Profile" title="Profile" />
    </header>
  </transition>
</template>

<script>
import UButton from '@/components/ui/UButton'
import UIcon from '@/components/ui/UIcon'

export default {
  name: 'LayoutHeader',

  components: {
    UButton,
    UIcon
  },

  data() {
    return {
      showHeader: true,
      prevScrollPosition: 0
    }
  },

  mounted() {
    window.addEventListener('scroll', this.handleScroll);
  },

  methods: {
    handleScroll() {
      const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;

      scrollPosition > this.prevScrollPosition ? this.showHeader = false : this.showHeader = true;
      this.prevScrollPosition = scrollPosition;
    }
  },

  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  }
}
</script>

<style lang="scss">
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 16px 20px;
  background-color: rgba($bg-color, 0.8);

  @include on-breakpoint('md') {
    padding: 24px 32px 20px;
  }

  &__logo {
    display: flex;
    transition: color $transition-timing-function $transition-duration;

    &:hover {
      color: $accent-color;
    }
  }
}
</style>
