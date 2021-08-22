<template>
  <div class="row">
    <div class="col-md-6 mt-3 mb-3"><Add /></div>
    <div class="col-md-6 mt-3 mb-3"><List /></div>
  </div>
</template>
<script>
import List from "./Product/List";
import Add from "./Product/Add";
export default {
  components: {
    List,
    Add,
  },
};
</script>
