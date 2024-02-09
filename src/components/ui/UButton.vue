<template>
  <component :is="to ? 'router-link' : href ? 'a' : 'button'" :class="classes" :disabled="disabled || loading"
    :style="styles" :to="!disabled ? to : null" :href="!disabled ? href : null" :target="href ? '_blank' : null"
    :type="type">
    <slot name="loader">
      <ULoader v-if="loading" />
    </slot>

    <div v-if="!loading" :class="{ invisible: loading }" class="relative flex items-center justify-center">
      <slot name="prepend">
        <UIcon v-if="icon" :class="[String(label) || $slots.default || iconPadding === true ? 'mr-2' : iconPadding]"
          :clickable="!disabled && !String(label)" :name="icon" :section="iconSection" :size="iconSize ? iconSize : null"
          :small="smallIcon" class="flex-shrink-0" />
      </slot>
      <div :class="{ 'mr-5': appendIcon || $slots.append }" class="flex items-center justify-center"
        style="line-height: normal;">
        <slot>
          {{ label }}
        </slot>
      </div>
      <slot name="append">
        <UIcon v-if="appendIcon" :clickable="!disabled && !String(label)" :name="appendIcon" :section="appendIconSection"
          :size="appendIconSize" class="flex-shrink-0 ml-auto" />
      </slot>
    </div>
  </component>
</template>
<script>
import ULoader from "@/components/ui/ULoader";
import UIcon from "@/components/ui/UIcon";

export default {
  name: "UButton",

  components: { ULoader, UIcon },

  props: {
    label: {
      type: [Number, String],
      default: "",
    },
    variant: {
      type: String,
      default: "default",
      validator: (v) => !v || ["default", "primary", "secondary"].includes(v),
    },
    size: {
      type: String,
      default: '',
      validator: (v) => !v || ['sm'].includes(v),
    },
    padding: {
      type: String,
      default: null,
    },

    icon: {
      type: String,
      default: '',
    },
    iconSection: {
      type: String,
      default: '',
    },
    iconSize: {
      type: String,
    },
    iconPadding: {
      type: [Boolean, String],
      default: null,
    },

    smallIcon: Boolean,

    appendIcon: {
      type: String,
      default: '',
    },
    appendIconSection: {
      type: String,
      default: '',
    },
    appendIconSize: {
      type: String,
      default: '',
    },

    to: {
      type: [String, Object],
      default: "",
    },

    href: {
      type: [String, Object],
      default: "",
    },

    disabled: Boolean,
    loading: Boolean,

    type: {
      type: String,
      default: "button",
      validator: (v) => ["button", "submit", "reset"].includes(v),
    },
  },

  computed: {
    classes() {
      return {
        btn: true,
        [`btn--${this.variant}`]: this.variant,
        [`btn--${this.size}`]: this.size,
        "btn-is-variant": this.variant !== "default",
        "btn--loading": this.loading,
        "btn--disabled": this.disabled,
        'btn--icon': (this.icon || this.$slots.prepend) && !this.label && !this.$slots.default,
      };
    },
    styles() {
      return {
        padding: this.padding,
      };
    },
  },
};
</script>

<style lang="scss" scoped>
.btn {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 52px;
  padding: 6px 11px;
  will-change: transform;
  backface-visibility: hidden;

  font: {
    family: 'PhosphateSolid';
    size: 18px;
    weight: 400;
  }

  color: $white-color;
  text-decoration: none;
  cursor: pointer;
  background: none;
  border: none;
  border-radius: $border-radius-btn;

  transition: color $transition-timing-function $transition-duration,
  border-color $transition-timing-function $transition-duration,
  background-color $transition-duration $transition-timing-function,
  background $transition-timing-function $transition-duration,
  opacity $transition-timing-function $transition-duration,
  transform $transition-timing-function $transition-duration;

  &:not(&[disabled]):focus-visible {
    transform: scale(1.15);

    @include on-breakpoint('md') {
      transform: scale(1.2);
    }
  }

  .u-icon {
    display: flex;
    width: 30px;
    height: 30px;
    flex-shrink: 0;
    fill: currentColor;
  }

  &--primary {
    width: 220px;
    text-transform: uppercase;
    color: $white-color;
    background-color: $accent-color;
    clip-path: url(#btnMask);

    &:not(&[disabled]):focus-visible,
    &:not(&[disabled]):hover {
      transform: scale(1.15);

      @include on-breakpoint('md') {
        transform: scale(1.2);
      }
    }

    &[disabled] {
      cursor: not-allowed;
    }

    &.btn--icon {
      width: 52px;
      padding: 4px;
      clip-path: url(#iconMask);
    }
  }

  &--secondary {
    color: $white-color;
    background: $accent-color-three;

    &:not(&[disabled]):focus-visible,
    &:not(&[disabled]):hover {
      transform: scale(1.15);

      @include on-breakpoint('md') {
        transform: scale(1.2);
      }
    }

    &[disabled] {
      cursor: not-allowed;
    }

    &.btn--icon {
      width: 52px;
      padding: 4px;
      clip-path: url(#iconMask);
    }
  }

  .mr-2 {
    margin-right: rem(2);
  }

  .mr-5 {
    margin-right: rem(5);
  }

  .flex-shrink-0 {
    flex-shrink: 0;
  }

  .ml-auto {
    margin-left: auto;
  }
}
</style>
