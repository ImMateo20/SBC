const estaLogeado = (req, res, next) => {
  if (req.session.usuario) {
    return next();
  }

  return res.redirect("/login");
};

const noEstaLogeado = (req, res, next) => {
  if (!req.session.usuario) {
    return next();
  }

  return res.redirect("/");
};

export { estaLogeado, noEstaLogeado };
