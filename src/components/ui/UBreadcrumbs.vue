<template>
  <ul class="breadcrumbs">
    <li class="breadcrumbs__item">
      <a href="/" class="breadcrumbs__item-link">
        <UIcon class="breadcrumbs__item-icon" name="home" size="14" />
        <span>Home</span>
      </a>
    </li>
    <li class="breadcrumbs__item">
      <a href="/character" class="breadcrumbs__item-link">Character</a>
    </li>
  </ul>
</template>

<script>
import UIcon from '@/components/ui/UIcon';

export default {
  name: 'UBreadcrumbs',

  components: { UIcon }
}
</script>

<style lang="scss" scoped>
.breadcrumbs {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 20px;
  width: fit-content;

  &__item {
    display: flex;
    align-items: center;
    margin-right: 4px;

    &:last-child {
      margin-right: auto;

      &::after {
        display: none;
      }

      .breadcrumbs__item-link {
        user-select: none;
        pointer-events: none;
        text-decoration: none;
      }
    }

    &::after {
      content: "";
      display: inline-block;
      background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1 8.5C0.723858 8.5 0.5 8.72386 0.5 9C0.5 9.27614 0.723858 9.5 1 9.5L1 8.5ZM17.3536 9.35355C17.5488 9.15829 17.5488 8.84171 17.3536 8.64645L14.1716 5.46447C13.9763 5.2692 13.6597 5.2692 13.4645 5.46447C13.2692 5.65973 13.2692 5.97631 13.4645 6.17157L16.2929 9L13.4645 11.8284C13.2692 12.0237 13.2692 12.3403 13.4645 12.5355C13.6597 12.7308 13.9763 12.7308 14.1716 12.5355L17.3536 9.35355ZM1 9.5L17 9.5V8.5L1 8.5L1 9.5Z' fill='white'/%3E%3C/svg%3E%0A");
      width: 17px;
      height: 18px;
      margin-left: 4px;
    }

    &-link {
      text-decoration: underline;
      text-decoration-thickness: 1px;
      transition: color $transition-duration $transition-timing-function;

      &:hover {
        color: $accent-color;
        text-decoration: none;
      }
    }

    &-icon {
      margin-right: 4px;
    }
  }
}
</style>
