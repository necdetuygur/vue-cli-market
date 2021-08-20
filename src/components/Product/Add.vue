<template>
  <div class="card">
    <div class="card-header">Yeni Ürün Ekle</div>
    <div class="card-body">
      <div class="input-group mb-3">
        <span class="input-group-text">Ürün Adı</span>
        <input type="text" class="form-control" v-model="name" />
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text">Ürün Fiyatı</span>
        <input type="text" class="form-control" v-model="price" />
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text">Ürün Resmi</span>
        <input type="file" class="form-control" @change="onChange($event)" />
      </div>
      <img height="128" class="img-responsive text-center mb-3" :src="photo" />
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
      title: "",
      price: 0,
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
      if (this.title) {
        this.emitter.emit("add", {
          id: new Date() * 1,
          title: this.title,
          price: this.price,
          photo: this.photo
        });
        this.title = "";
        this.price = 0;
        this.photo = null;
      }
    },
  },
};
</script>
