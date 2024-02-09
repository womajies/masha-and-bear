<template>
  <a class="characters-card" href="/">
    <h3 class="characters-card__title">Penguin</h3>
    <picture>
      <source srcset="../../assets/img/penguin.webp, ../../assets/img/penguin@2x.webp 2x" type="image/webp">
      <img class="characters-card__img" src="../../assets/img/penguin.png" srcset="../../assets/img/penguin@2x.png 2x"
        alt="Image">
    </picture>
    <p class="characters-card__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
      incididunt</p>
  </a>
</template>

<script>
export default {
  name: 'CharactersItem',
}
</script>

<style lang="scss" scoped>
.characters-card {
  position: relative;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 264px;
  padding: 20px 24px;
  margin-top: 24px;
  border: $border-width solid $white-color;
  border-radius: $border-radius-block;
  background-color: $white-color;
  cursor: pointer;

  @include on-breakpoint('md') {
    max-width: 306px;
    padding: 16px 28px;
    margin-top: 30px;
  }

  &::before {
    content: "";
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    width: 0%;
    height: 100%;
    border-radius: 50% 0 0 50%;
    background-color: rgba($accent-color-two, 0.8);
    transition: background-color 1s $transition-timing-function, width 1s $transition-timing-function;
  }

  &:hover::before,
  &:focus::before {
    width: 180%;
  }

  &__title {
    font-family: 'PhosphateSolid';
    font-weight: 400;
    font-size: 28px;
    text-transform: uppercase;
    color: $accent-color-four;

    @include on-breakpoint('md') {
      font-size: 32px;
    }
  }

  &__img {
    margin-top: 15px;

    @include on-breakpoint('md') {
      margin-top: 17px;
    }
  }

  &__text {
    font-size: 12px;
    line-height: 20px;
    text-align: center;
    color: #c8c8c8;
    margin-top: 15px;

    @include on-breakpoint('md') {
      font-size: 16px;
      line-height: 24px;
      margin-top: 17px;
    }
  }
}
</style>
