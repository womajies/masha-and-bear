<template>
  <div class="slider-wrapper">
    <swiper loop navigation :slides-per-view="3" :slideToClickedSlide="true" :centeredSlides="true" :grab-cursor="true"
      :thumbs="{ swiper: thumbsSwiper }" :modules="modules" class="character-swiper">
      <swiper-slide v-for="item in mockCharactersData" :key="item.id">
        <picture>
          <source
            :srcset="require(`../../assets/img/character-${item.img}.webp`) + ', ' + require(`../../assets/img/character-${item.img}@2x.webp`) + ' 2x'"
            type="image/webp">
          <img :src="require(`../../assets/img/character-${item.img}.png`)"
            :srcset="require(`../../assets/img/character-${item.img}@2x.png`) + ' 2x'" alt="Image">
        </picture>
      </swiper-slide>
      <div class="character-swiper__info">Base appearance</div>
    </swiper>
    <swiper loop :slides-per-view="1" :space-between="20" :allowTouchMove="false" :modules="modules" class="info-swiper"
      @swiper="setThumbsSwiper">
      <swiper-slide v-for="item in mockCharactersData" :key="item.id">
        <div class="info-swiper__content">
          <h2 class="info-swiper__title">{{ item.title }}</h2>
          <ul class="info-swiper__list">
            <li class="info-swiper__item">
              <UIcon class="info-swiper__icon" name="eye" width="23" height="24" />
              245 К
            </li>
            <li class="info-swiper__item">
              <UIcon class="info-swiper__icon" name="calendar" width="16" height="16" />
              <time datetime="2023-08-24">24.08.2023</time>
            </li>
            <li class="info-swiper__item">
              <UIcon class="info-swiper__icon" name="message" width="16" height="13" />
              172
            </li>
            <li class="info-swiper__item">
              <UIcon class="info-swiper__icon" name="heart" width="18" height="18" />
              15 K
            </li>
          </ul>
          <p class="info-swiper__text">
            <template v-for="(text, index) in item.texts" :key="text">
              <br v-if="index !== 0">
              <br v-if="index !== 0">
              {{ text }}
            </template>
          </p>
        </div>
        <UButton class="info-swiper__btn" variant="primary" @click="showModal = item">Read more</UButton>
      </swiper-slide>
    </swiper>
    <InfoModal v-if="showModal" :item="showModal" @before-close="showModal = false" />
  </div>
</template>

<script>
import UButton from '@/components/ui/UButton';
import InfoModal from '@/components/modal/InfoModal';
import { ref, reactive } from 'vue';
import { Navigation, Pagination, Thumbs, FreeMode } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/vue';
import 'swiper/scss';
import 'swiper/scss/navigation';
import 'swiper/scss/pagination';

export default {
  name: 'SliderWrapper',

  components: {
    UButton,
    InfoModal,
    Swiper,
    SwiperSlide,
  },
  setup() {
    const mockCharactersData = reactive([
      {
        id: 0,
        title: 'Guest Character: Panda',
        texts: [`Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua. Porttitor massa id neque aliquam vestibulum morbi blandit. Egestas egestas fringilla phasellus
            faucibus scelerisque eleifend donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet
            venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 0
      },
      {
        id: 1,
        title: 'Guest Character: Panda 2',
        texts: [`Sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua. Porttitor massa id neque aliquam vestibulum morbi blandit. Egestas egestas fringilla phasellus
            faucibus scelerisque eleifend donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet
            venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 1
      },
      {
        id: 2,
        title: 'Guest Character: Panda 3',
        texts: [`Donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 2
      },
      {
        id: 3,
        title: 'Guest Character: Panda',
        texts: [`Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua. Porttitor massa id neque aliquam vestibulum morbi blandit. Egestas egestas fringilla phasellus
            faucibus scelerisque eleifend donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet
            venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 0
      },
      {
        id: 4,
        title: 'Guest Character: Panda 2',
        texts: [`Sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua. Porttitor massa id neque aliquam vestibulum morbi blandit. Egestas egestas fringilla phasellus
            faucibus scelerisque eleifend donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet
            venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 1
      },
      {
        id: 5,
        title: 'Guest Character: Panda 3',
        texts: [`Donec pretium vulputate. Malesuada nunc vel risus commodo viverra. Enim sit amet
            venenatis urna.`,
          `In tellus integer feugiat scelerisque varius. Enim eu turpis egestas pretium. At elementum eu facilisis sed
            odio morbi quis commodo odio. Rhoncus mattis rhoncus urna neque viverra.`],
        img: 2
      },
    ])
    const thumbsSwiper = ref(null);
    const showModal = ref(null);

    const setThumbsSwiper = (swiper) => {
      thumbsSwiper.value = swiper;
    };

    return {
      thumbsSwiper,
      setThumbsSwiper,
      mockCharactersData,
      showModal,
      modules: [Navigation, Pagination, Thumbs, FreeMode],
    };
  },
};
</script>

<style lang="scss">
.slider-wrapper {
  @include on-breakpoint('lg') {
    display: flex;
  }
}

.character-swiper {
  width: 358px;
  padding-bottom: 44px;

  @include on-breakpoint('md') {
    width: 376px;
  }

  @include on-breakpoint('lg') {
    width: 482px;
    height: 476px;
    flex-shrink: 0;
    padding-bottom: 44px;
  }

  .swiper-slide {
    // width: 33.3%;
    margin-top: auto;
    margin-bottom: -16px;
    transition: transform $transition-duration $transition-timing-function, opacity $transition-duration $transition-timing-function, margin-bottom $transition-duration $transition-timing-function;
    transform: translateZ(0) scale(0.8) !important;
    opacity: 0.6;
    user-select: none;

    @include on-breakpoint('lg') {
      display: flex;
      align-items: flex-end;
      height: fit-content;
      margin-bottom: 0;
      transform: translateZ(0) scale(1) !important;
    }

    &-active {
      transform: translateZ(0) scale(1) !important;
      opacity: 1;
      z-index: 1;
      margin-bottom: 0;

      @include on-breakpoint('lg') {
        transform: translateZ(0) scale(1.5) !important;
        margin-bottom: 40px;
      }
    }
  }

  &__info {
    align-items: center;
    justify-content: center;
    position: absolute;
    bottom: 4px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1;
    width: 358px;
    padding: 16px;
    background-color: $accent-color-two;
    border-radius: $border-radius-block;
    font-family: 'PhosphateSolid';
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    text-align: center;
    text-transform: uppercase;
    box-shadow: 0px 2px 4px rgba(50, 50, 50, 0.2);

    @include on-breakpoint('md') {
      width: 360px;
    }
  }
}

.info-swiper {
  margin-top: -16px;

  @include on-breakpoint('lg') {
    margin-top: 0;
  }

  &__content {
    width: 358px;
    height: 314px;
    padding: 24px 24px 50px;
    margin: 0 auto;
    box-sizing: border-box;
    background-color: $white-color;
    border-radius: $border-radius-btn;
    clip-path: url(#smallGuestMask);

    @include on-breakpoint('md') {
      width: 696px;
      height: 306px;
      padding: 40px 24px 70px;
      clip-path: url(#mediumGuestMask);
    }

    @include on-breakpoint('lg') {
      width: 546px;
      height: 476px;
      padding: 40px 40px 60px;
      clip-path: url(#bigGuestMask);
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
    @include text-truncate(100%, 1);

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
    @include text-truncate(100%, 7);

    @include on-breakpoint('md') {
      font-size: 16px;
      @include text-truncate(100%, 5);
    }

    @include on-breakpoint('lg') {
      @include text-truncate(100%, 12);
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

  &__btn.btn {
    display: flex;
    margin: -26px auto 5px;
    box-sizing: border-box;

    @include on-breakpoint('md') {
      margin-top: -20px;
    }
  }
}

.swiper-button-prev,
.swiper-button-next {
  display: none;
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  width: 52px;
  height: 52px;
  clip-path: url(#iconMask);
  filter: drop-shadow(0px 2px 4px rgba(50, 50, 50, 0.2));
  background-color: rgba(50, 50, 50, 0.6);
  transition: background-color $transition-duration $transition-timing-function;

  @include on-breakpoint('lg') {
    display: flex;
  }

  &:hover {
    background: rgba(50, 50, 50, 0.9);
  }

  &::after {
    content: '';
    width: 30px;
    height: 30px;
    background-image: url("data:image/svg+xml,%3Csvg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cg clip-path='url(%23clip0_1266_851)'%3E%3Cpath d='M6.36712 16.2139C6.2495 15.2261 6.25889 14.1388 6.63995 13.6125C7.021 13.0863 7.4637 12.9417 8.68572 12.9208C9.3533 12.9093 23.2921 12.9051 23.7735 13.0362C24.255 13.1675 24.6038 13.4341 24.7406 13.9646C24.8729 14.4771 24.9735 15.6814 24.7018 16.4785C24.4906 17.0986 24.2184 17.5109 23.052 17.5759C22.1315 17.6273 8.25516 17.6335 7.2582 17.3381C6.71079 17.1757 6.42916 16.7341 6.36712 16.2139Z' fill='white'/%3E%3Cpath d='M5.71798 14.7947C6.31354 14.0107 7.06722 13.2486 7.69839 13.1537C8.32956 13.0589 8.74173 13.2788 9.62048 14.153C10.1006 14.6307 15.3165 19.9919 15.5668 20.435C15.8171 20.8781 15.8803 21.3205 15.6126 21.7952C15.3539 22.2538 14.5974 23.1785 13.8576 23.5447C13.2823 23.8294 12.8065 23.9229 11.9369 23.1201C11.2506 22.487 6.07751 17.1725 5.57551 16.238C5.29994 15.7249 5.40426 15.2077 5.71798 14.7947Z' fill='white'/%3E%3Cpath d='M6.61448 17.2717C5.85258 16.6589 5.112 15.8833 5.01982 15.2338C4.92764 14.5843 5.14136 14.1602 5.99095 13.256C6.45518 12.762 12.0543 6.99434 12.4849 6.73696C12.9154 6.47939 13.3454 6.41434 13.8067 6.68984C14.2523 6.95608 15.151 7.73445 15.5069 8.4957C15.7836 9.08779 15.8744 9.57737 15.0943 10.4721C14.4302 11.2338 8.89825 16.917 8.01715 17.4181C7.51848 17.7017 7.01589 17.5945 6.61448 17.2717Z' fill='white'/%3E%3C/g%3E%3Cdefs%3E%3CclipPath id='clip0_1266_851'%3E%3Crect width='20' height='17.5' fill='white' transform='matrix(1 0 0 -1 5 23.75)'/%3E%3C/clipPath%3E%3C/defs%3E%3C/svg%3E%0A");
  }
}

.swiper-button-next {
  right: 0;
  left: auto;

  &::after {
    transform: rotate(180deg);
  }
}
</style>
