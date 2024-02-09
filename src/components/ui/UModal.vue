<template>
  <transition name="modal modal-fade">
    <div v-if="isOpened" class="modal" :class="modalClasses" @mousedown="handleMouseDownContainer" @click.stop>
      <div class="modal__wrapper">
        <component :is="form ? 'UForm' : 'div'" :class="modalSize" class="modal__body">
          <UButton class="modal__close" type="button" variant="secondary" @click="close">
            <template v-slot:prepend>
              <slot name="close">
                <UIcon class="modal__close-icon" size="30" name="close" />
              </slot>
            </template>
          </UButton>

          <slot name="header"></slot>

          <slot></slot>
        </component>
      </div>
    </div>
  </transition>
</template>

<script>
import UButton from '@/components/ui/UButton.vue'
import UIcon from '@/components/ui/UIcon.vue'

export default {
  name: 'UModal',

  components: { UButton, UIcon },

  props: {
    size: {
      type: String,
      default: 'small',
      validator: (v) => ['small', 'medium', 'large'].includes(v),
    },

    form: Boolean,

    customHeight: {
      type: Number,
      default: null,
    },
    customWidth: {
      type: Number,
      default: null,
    },
    maxHeight: {
      type: Number,
      default: null,
    },
  },

  emits: ['before-close'],

  data() {
    return {
      isOpened: false,
    }
  },

  computed: {
    modalClasses() {
      return {
        active: this.isOpened,
      }
    },

    modalSize() {
      return `modal__body--${this.size}`
    }
  },

  created() {
    this.show()
  },

  mounted() {
    document.addEventListener('keydown', this.handleKeyDown);
  },

  beforeUnmount() {
    this.close()
    document.removeEventListener('keydown', this.handleKeyDown);
  },

  methods: {
    handleKeyDown(e) {
      if (e.keyCode === 27) this.close();
    },

    handleMouseDownContainer(event) {
      if (event.target.classList.contains('modal') || event.target.classList.contains('modal__wrapper')) {
        this.close()
      }
    },

    show() {
      document.body.style.overflow = 'hidden'
      document.body.style.height = '100vh'
      // this.$emit('before-open', this.$props)
      this.isOpened = true
    },

    close() {
      document.body.style.overflow = ''
      document.body.style.height = '100%'
      this.$emit('before-close')
      this.isOpened = false
    },
  },
};
</script>
<style lang="scss">
.modal {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 100;
  overflow: auto;
  background-color: #281d04;

  &.active {
    display: flex;
    align-items: center;
  }

  &__wrapper {
    display: flex;
    width: 100%;
    height: 100%;
    padding: 16px;
    overflow: hidden auto;

    @include on-breakpoint('md') {
      align-items: center;
      justify-content: center;
    }
  }

  &__body {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    justify-items: center;
    width: 100%;
    max-width: 1100px;
    padding: 16px 16px 20px;
    margin: auto;
    background-color: $white-color;
    border-radius: $border-radius-block;

    @include on-breakpoint('md') {
      padding: 27px 24px 36px;
    }

    @include on-breakpoint('lg') {
      padding: 40px 24px;
      flex-direction: row;
    }

    &::before {
      content: '';
      position: absolute;
      top: -1px;
      right: 0;
      z-index: 1;
      width: 55px;
      height: 57px;
      background-color: #281d04;
      clip-path: url(#closeMask);
    }
  }

  &__title {
    margin-bottom: 6px;
    font-size: 28px;
    line-height: 130%;
    font-weight: 700;
    text-align: center;
    text-transform: uppercase;
    color: $accent-color-four;

    @include on-breakpoint('md') {
      font-size: 40px;
    }
  }

  &__text {
    font-size: 16px;
    font-weight: 400;
    line-height: 140%;
    text-align: center;
    color: $white-color;

    @include on-breakpoint('md') {
      font-size: 18px;
    }

    a {
      text-decoration: underline;
      transition: color $transition-duration $transition-timing-function;

      &:hover {
        color: $accent-color;
      }
    }
  }

  .modal__close {
    position: absolute;
    top: -3px;
    right: -5px;
    z-index: 2;
    width: 52px;
    height: 52px;

    &:hover {
      color: $white-color;
    }
  }
}
</style>
