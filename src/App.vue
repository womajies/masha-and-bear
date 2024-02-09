<template>
  <div class="page">
    <LayoutHeader />
    <main class="main container">
      <UBreadcrumbs />
      <SliderWrapper />
      <CharactersList />
    </main>
    <LayoutFooter />
  </div>
  <CommonSvgMasks />
  <CommonScrollbarProgress />
</template>

<script>
import LayoutHeader from '@/components/layout/LayoutHeader'
import LayoutFooter from '@/components/layout/LayoutFooter'
import UBreadcrumbs from '@/components/ui/UBreadcrumbs'
import CharactersList from '@/components/views/CharactersList'
import SliderWrapper from '@/components/views/SliderWrapper'
import CommonSvgMasks from '@/components/common/CommonSvgMasks'
import CommonScrollbarProgress from '@/components/common/CommonScrollbarProgress'

export default {
  name: 'App',
  components: {
    LayoutHeader,
    LayoutFooter,
    UBreadcrumbs,
    CharactersList,
    SliderWrapper,
    CommonSvgMasks,
    CommonScrollbarProgress
  }
}
</script>

<style lang="scss">
.page {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
.main {
  padding-top: 88px;

  @include on-breakpoint('md') {
    padding-top: 96px;
  }
}
</style>
