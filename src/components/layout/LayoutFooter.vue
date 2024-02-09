<template>
  <footer class="footer">
    <div class="footer__wrapper">
      <a href="/" class="header__logo" aria-label="Логотип Logoipsum">
        <UIcon name="logo" width="240" height="43" />
      </a>

      <nav class="footer__nav nav">
        <ul class="nav__list">
          <li class="nav__item">
            <a href="/privacy" class="nav__link" target="_blank">Privacy Policy</a>
          </li>
          <li class="nav__item">
            <a href="/cookies" class="nav__link" target="_blank">Cookies</a>
          </li>
          <li class="nav__item">
            <a href="/notice" class="nav__link" target="_blank">Legal Notice</a>
          </li>
        </ul>
      </nav>

      <div class="footer__copyright">
        &copy; LoremIpsum, 2008-2023,
        <a href="www.example.com" class="footer__copyright-link" target="_blank">www.example.com</a>
      </div>
    </div>
  </footer>
</template>

<script>
import UIcon from '@/components/ui/UIcon'

export default {
  name: 'LayoutFooter',

  components: { UIcon }
}
</script>

<style lang="scss">
.footer {
  position: relative;
  padding-top: 62px;
  margin-top: auto;
  background: linear-gradient(180deg, rgba(244, 186, 70, 0) 0%, #F8BB39 6.77%);

  @include on-breakpoint('md') {
    padding-top: 23px;
  }

  &__wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-image: url('../../assets/img/footer-bg.png');
    padding-bottom: 40px;
    padding-top: 83px;

    @include on-breakpoint('md') {
      padding-top: 115px;
    }
  }

  &__copyright {
    margin-top: 35px;

    &-link:hover {
      text-decoration: underline;
    }
  }
}

.nav {
  display: flex;

  &__list {
    display: grid;
    grid-auto-flow: column;
    gap: 40px;
    margin-top: 40px;
  }

  &__link:hover {
    text-decoration: underline;
  }
}
</style>
