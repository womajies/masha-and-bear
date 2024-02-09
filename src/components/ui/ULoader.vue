<template>
  <svg class="loader animate-spin" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 30 30" v-bind="$attrs">
      <radialGradient id="paint_angular_69_48305_0" cx="0.000000" cy="0.000000" r="1.000000"
        gradientUnits="userSpaceOnUse" gradientTransform="translate(15 15) rotate(-41.338) scale(12.7424 12.7424)">
        <stop offset="0.723958" stop-color="#702C7E" stop-opacity="0.600000" />
        <stop offset="0.865235" stop-color="#702C7E" stop-opacity="0.600000" />
        <stop offset="0.890625" stop-color="#FFFFFF" />
      </radialGradient>
    <path id="Ellipse 70"
      d="M17.0938 0.0177002C19.9883 0.422852 22.6191 1.65588 24.7397 3.46924C27.5669 5.87927 29.2744 9.11914 29.812 12.5267C30.3965 16.1956 29.5908 19.7681 27.7861 22.7081C25.8481 25.8778 22.9155 28.0709 19.6338 29.1348C16.1016 30.2863 12.4473 30.0492 9.26074 28.7271C5.82715 27.3086 3.20215 24.7549 1.63818 21.6803C-0.0517578 18.3717 -0.38916 14.725 0.417969 11.3712C1.10693 8.48999 2.58887 6.00391 4.57568 4.08618C5.41016 3.28064 6.73584 3.49792 7.41797 4.4364C8.09961 5.37439 7.87207 6.67529 7.08252 7.52466C5.79541 8.91003 4.9248 10.5808 4.50098 12.3519C3.87402 14.9524 4.25049 17.5621 5.37939 19.7744C6.5918 22.1589 8.57275 23.8989 10.8682 24.8479C13.3384 25.8739 15.9751 25.9102 18.3369 25.1411C20.8818 24.317 22.9102 22.6323 24.2065 20.5137C25.6064 18.2344 26.0547 15.6359 25.6646 13.183C25.2485 10.5406 23.9019 8.27356 22.0122 6.66174C20.5513 5.41138 18.8501 4.62097 17.0864 4.27515C15.9482 4.05188 15 3.13245 15 1.97278C15 0.812744 15.9448 -0.143188 17.0938 0.0177002Z"
      fill="url(#paint_angular_69_48305_0)" fill-opacity="1.000000" fill-rule="evenodd" />
  </svg>
</template>

<script>
export default {
  name: "ULoader",
};
</script>

<style lang="scss" scoped>
@-webkit-keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.loader {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -8px -8px;
}

.animate-spin {
  width: 14px;
  -webkit-animation: spin 1s linear infinite;
  animation: spin 1s linear infinite;
}
</style>
