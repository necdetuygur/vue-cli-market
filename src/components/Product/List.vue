<template>
  <div class="card">
    <div class="card-header">Ürünler</div>
    <div class="card-body">
      <ul class="list-group list-group-flush" v-if="products.length > 0">
        <li class="list-group-item" v-for="product in products" :key="product.id">
          <div class="row">
            <div class="col-md-4">
              <img
                height="128"
                class="img-responsive text-center mb-3"
                :src="product.photo"
              />
            </div>
            <div class="col-md-6">
              <div>
                Ürün Adı:
                {{ product.name }}
              </div>
              <div>
                Ürün Fiyatı:
                {{ product.price }}
              </div>
            </div>
            <div class="col-md-2">
              <button
                type="button"
                class="btn btn-danger float-end"
                @click="del(product.id)"
              >
                Sil
              </button>
            </div>
          </div>
        </li>
      </ul>
      <div v-else>Hiç ürün eklenmedi.</div>
    </div>
  </div>
</template>
<script>
import ls from "../../ls.js";

export default {
  data() {
    return {
      products: [],
    };
  },
  created() {
    this.products = ls("products");
    this.emitter.on("add", (product) => {
      this.products.push(product);
      ls("products", this.products);
    });
  },
  methods: {
    del(id) {
      let index = this.products.findIndex((i) => {
        return i.id == id;
      });
      this.products.splice(index, 1);
      ls("products", this.products);
    },
  },
};
</script>
