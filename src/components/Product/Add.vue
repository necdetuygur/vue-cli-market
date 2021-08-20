<template>
  <div class="card">
    <div class="card-header">Yeni Ürün Ekle</div>
    <div class="card-body">
      <div class="input-group input-group-sm mb-3">
        <span class="input-group-text">Ürün Adı</span>
        <input type="text" class="form-control" v-model="name" />
      </div>
      <div class="input-group input-group-sm mb-3">
        <span class="input-group-text">Ürün Fiyatı</span>
        <input type="number" step="0.01" class="form-control" v-model="price" />
      </div>
      <div class="input-group input-group-sm mb-3">
        <span class="input-group-text">Ürün Barkodu</span>
        <input type="text" class="form-control" v-model="barcode" />
      </div>
      <div class="input-group input-group-sm mb-3">
        <span class="input-group-text">Ürün Resmi</span>
        <input type="file" class="form-control" @change="onChange($event)" />
      </div>
      <img height="128" class="img-responsive text-center mb-3" :src="photo" />
      <button type="button" class="btn btn-primary btn-sm float-end" @click="add()">
        Kaydet
      </button>
    </div>
  </div>
</template>
<script>
import toBase64 from "../../toBase64";
export default {
  data() {
    return {
      name: "",
      price: 0,
      barcode: 0,
      photo: null,
    };
  },
  methods: {
    onChange(e) {
      const that = this;
      const file = e.target.files[0];
      toBase64(file).then((r) => {
        that.photo = r;
      });
    },
    add() {
      if (this.name) {
        this.emitter.emit("add", {
          id: new Date() * 1,
          name: this.name,
          price: this.price,
          barcode: this.barcode,
          photo: this.photo,
        });
        this.name = "";
        this.price = 0;
        this.barcode = 0;
        this.photo = null;
      }
    },
  },
};
</script>
