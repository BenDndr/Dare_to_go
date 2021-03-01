const alerte_failed = () => {
  fetch('/alertes', { headers: { accept: "application/json" } })
    .then(response => response.json())
    .then((data) => {
      // console.log(data.alertes);
      if (data.alertes != null) {
        swal({
          title: "A nice alert",
          text: `${data.alertes} failed`,
          icon: "error"
        });
      };
    });
}

export { alerte_failed };
