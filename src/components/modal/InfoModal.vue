<template>
  <UModal class="info-modal">
    <picture style="flex-shrink: 0;">
      <source :srcset="require(`../../assets/img/character-${item.img}.webp`) + ', ' + require(`../../assets/img/character-${item.img}@2x.webp`) + ' 2x'" type="image/webp">
      <img :src="require(`../../assets/img/character-${item.img}.png`)"
        :srcset="require(`../../assets/img/character-${item.img}@2x.png`) + ' 2x'" alt="Image" class="info-modal__img">
    </picture>
    <div class="info-modal__content">
      <h2 class="info-modal__title">{{ item.title }}</h2>
      <ul class="info-modal__list">
        <li class="info-modal__item">
          <UIcon class="info-modal__icon" name="eye" width="23" height="24" />
          245 К
        </li>
        <li class="info-modal__item">
          <UIcon class="info-modal__icon" name="calendar" width="16" height="16" />
          <time datetime="2023-08-24">24.08.2023</time>
        </li>
        <li class="info-modal__item">
          <UIcon class="info-modal__icon" name="message" width="16" height="13" />
          172
        </li>
        <li class="info-modal__item">
          <UIcon class="info-modal__icon" name="heart" width="18" height="18" />
          15 K
        </li>
      </ul>
      <p class="info-modal__text">
        <template v-for="(text, index) in item.texts" :key="text">
          <br v-if="index !== 0">
          <br v-if="index !== 0">
          {{ text }}
        </template>
      </p>
      <div class="info-modal__foot">
        <h3 class="info-modal__foot-title">In leading roles</h3>
        <a href="/" class="info-modal__foot-link">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua.</a>
        <h3 class="info-modal__foot-title">Directors</h3>
        <a href="/" class="info-modal__foot-link">Lorem ipsum dolor sit amet, consectetur adipiscing.</a>
      </div>
    </div>
  </UModal>
</template>

<script>
import UModal from '@/components/ui/UModal';
import UIcon from '@/components/ui/UIcon';

export default {
  name: 'InfoModal',

  components: {
    UModal,
    UIcon,
  },

  props: {
    item: {
      type: Object,
      default: () => {
        return {}
      },
      required: true
    },
  }
}
</script>

<style lang="scss">
.info-modal {
  &__img {
    display: block;
    max-height: 286px;
    margin-bottom: 42px;
    transform: rotateY(180deg);

    @include on-breakpoint('md') {
      max-height: 260px;
      margin-bottom: 23px;
    }

    @include on-breakpoint('lg') {
      max-height: 372px;
      margin-bottom: 0;
      margin-right: 80px;
    }
  }

  &__title {
    margin-bottom: 8px;
    font-family: 'PhosphateSolid';
    font-weight: 400;
    font-size: 24px;
    line-height: 1;
    color: #c4296c;
    text-transform: uppercase;

    @include on-breakpoint('md') {
      margin-bottom: 12px;
      font-size: 40px;
      line-height: 1;
    }
  }

  &__text {
    margin-top: 12px;
    font-size: 12px;
    line-height: 24px;
    color: #767679;

    @include on-breakpoint('md') {
      font-size: 16px;
    }
  }

  &__list {
    display: flex;
  }

  &__item {
    display: flex;
    align-items: center;
    margin-right: 16px;
    font-size: 12px;
    line-height: 16px;
    color: #767679;

    &:last-child {
      margin-right: 0;
    }
  }

  &__icon {
    margin-right: 4px;
  }

  &__foot {
    margin-top: 16px;

    &-title {
      margin-bottom: 2px;
      font-size: 12px;
      line-height: 24px;
      color: #323232;

      @include on-breakpoint('md') {
        font-size: 16px;
      }

      &:not(:nth-of-type(1)) {
        margin-top: 20px;
      }
    }

    &-link {
      display: block;
      color: #c4296c;

      &:hover {
        text-decoration: underline;
      }
    }
  }
}
</style>
