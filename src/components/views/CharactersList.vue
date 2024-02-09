<template>
  <section class="characters">
    <div class="characters-block">
      <h2 class="characters-block__title">All characters list</h2>
    </div>
    <UButton class="characters__btn" variant="primary" :loading="isLoading" @click="toggleShowItems">{{ showItems > 1 ?
      'Hide' : 'Load more' }}</UButton>

    <transition-group name="characters-fade" tag="div" class="characters-cards">
      <CharactersItem v-for="item in showItems" :key="item" />
    </transition-group>
  </section>
</template>

<script>
import UButton from '@/components/ui/UButton'
import CharactersItem from '@/components/views/CharactersItem'

export default {
  name: 'CharactersList',

  components: { UButton, CharactersItem },

  data() {
    return {
      showItems: 1,
      isLoading: false
    }
  },

  methods: {
    toggleShowItems() {
      try {
        this.isLoading = true;

        if (this.showItems === 1) {

          setTimeout(() => {
            this.showItems = 4;
            this.isLoading = false;
          }, 500)

        } else {
          this.showItems = 1;
          this.isLoading = false;
        }
      } catch (error) {
        console.error(error);
        this.isLoading = false;
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.characters {
  margin-top: $space-small;

  @include on-breakpoint('md') {
    margin-top: $space-big;
  }

  &-block {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 358px;
    height: 110px;
    padding: 20px 20px 30px;
    margin: 0 auto;
    clip-path: url(#smallCharactersMask);
    background-color: $accent-color-two;
    border-radius: $border-radius-block;

    @include on-breakpoint('md') {
      width: 672px;
      height: 166px;
      clip-path: url(#bigCharactersMask);
    }

    &__title {
      font-family: 'PhosphateSolid';
      font-weight: 400;
      font-size: 20px;
      line-height: 25px;
      text-transform: uppercase;
      text-align: center;

      @include on-breakpoint('md') {
        font-size: 40px;
        line-height: 50px;
      }
    }
  }

  &__btn {
    display: flex;
    align-items: center;
    justify-content: center;
    margin: -18px auto 0;
  }

  &-cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    max-width: 1092px;
    margin: 18px auto 0;

    @include on-breakpoint('md') {
      margin-top: 12px;
    }
  }
}
</style>
