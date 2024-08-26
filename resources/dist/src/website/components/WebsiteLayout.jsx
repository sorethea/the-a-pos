import TabTitle from "../../shared/tab-title/TabTitle";
import {getFormattedMessage, placeholderText} from "../../shared/sharedMethod";
import {Image} from "react-bootstrap-v5";
import {Link} from "react-router-dom";
import React from "react";


export const WebsiteLayout = () => {
    return (
        <div className="content d-flex flex-column flex-column-fluid">
            <div className="d-flex flex-wrap flex-column-fluid">
                <div className="d-flex flex-column flex-column-fluid align-items-center justify-content-center p-4">
                    <TabTitle
                        title={placeholderText("login-form.login-btn.label")}
                    />
                    <div className="col-12 text-center align-items-center justify-content-center">
                        <a href="#" className="image">
                            <Image
                                className="logo-height image login-company-logo mb-7 mb-sm-10"
                                src={
                                    frontSetting &&
                                    frontSetting.value &&
                                    frontSetting.value.logo
                                }
                            />
                        </a>
                    </div>
                    <div className="bg-theme-white rounded-15 shadow-md width-540 px-5 px-sm-7 py-10 mx-auto">
                        <h1 className="text-dark text-center mb-7">
                            {getFormattedMessage("login-form.title")}
                        </h1>
                        <form>
                            <div className="mb-sm-7 mb-4">
                                <label className="form-label">
                                    {getFormattedMessage(
                                        "globally.input.email.label"
                                    )}{" "}
                                    :
                                </label>
                                <span className="required" />
                                <input
                                    placeholder={placeholderText(
                                        "globally.input.email.placeholder.label"
                                    )}
                                    required
                                    value={loginInputs.email}
                                    className="form-control"
                                    type="text"
                                    name="email"
                                    autoComplete="off"
                                    onChange={(e) => handleChange(e)}
                                />
                                <span className="text-danger d-block fw-400 fs-small mt-2">
                                    {errors["email"] ? errors["email"] : null}
                                </span>
                            </div>

                            <div className="mb-sm-7 mb-4">
                                <div className="d-flex justify-content-between mt-n5">
                                    <div className="d-flex justify-content-between w-100">
                                        <label className="form-label">
                                            {getFormattedMessage(
                                                "user.input.password.label"
                                            )}
                                            :
                                            <span className="required" />
                                        </label>
                                        <Link
                                            to="/forgot-password"
                                            className="link-info fs-6 text-decoration-none"
                                        >
                                            {getFormattedMessage(
                                                "login-form.forgot-password.label"
                                            )}
                                        </Link>
                                    </div>
                                </div>
                                <input
                                    className="form-control"
                                    type="password"
                                    name="password"
                                    placeholder={placeholderText(
                                        "user.input.password.placeholder.label"
                                    )}
                                    autoComplete="off"
                                    required
                                    value={loginInputs.password}
                                    onChange={(e) => handleChange(e)}
                                />
                                <span className="text-danger d-block fw-400 fs-small mt-2">
                                    {errors["password"]
                                        ? errors["password"]
                                        : null}
                                </span>
                            </div>
                            <div className="text-center">
                                <button
                                    type="submit"
                                    className="btn btn-primary w-100"
                                    onClick={(e) => onLogin(e)}
                                >
                                    {loading ? (
                                        <span className="d-block">
                                            {getFormattedMessage(
                                                "globally.loading.label"
                                            )}
                                        </span>
                                    ) : (
                                        <span>
                                            {getFormattedMessage(
                                                "login-form.login-btn.label"
                                            )}
                                        </span>
                                    )}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}
