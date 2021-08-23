<template>
  <div class="card">
    <div class="card-header">Yeni Ürün Ekle</div>
    <div class="card-body">
      <div class="form-group mb-3">
        <label class="col-form-label">Ürün Adı</label>
        <input type="text" class="form-control" placeholder="Ürün Adı" v-model="name" />
      </div>
      <div class="form-group mb-3">
        <label class="col-form-label">Ürün Fiyatı</label>
        <input type="number" step="0.01" class="form-control" placeholder="Ürün Fiyatı" v-model="price" />
      </div>
      <div class="form-group mb-3">
        <label class="col-form-label">Ürün Barkodu</label>
        <input type="text" class="form-control" placeholder="Ürün Barkodu" v-model="barcode" />
      </div>
      <div class="form-group mb-3">
        <label class="col-form-label">Ürün Resmi</label>
        <img height="128" class="img-responsive text-center mb-3" :src="photo" />
        <input ref="file" type="file" class="form-control" @change="onChange($event)" />
      </div>
      <button type="button" class="btn btn-primary float-end" @click="add()">
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
      name: null,
      price: null,
      barcode: null,
      photo: null
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
        this.name = null;
        this.price = null;
        this.barcode = null;
        this.photo = null;
        this.$refs.file.value = null;
      }
    },
  },
};
</script>
