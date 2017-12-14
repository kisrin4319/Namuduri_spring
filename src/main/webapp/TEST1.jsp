<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/ais-one/pen/mAxKpp?depth=everything&order=popularity&page=28&q=vue&show_forks=false" />
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<style class="cp-pen-styles"></style>
</head>
<body>
	<div class="container">
		<p>
			<img class="img-responsive" alt="iamgurdeeposahan" src="${pageContext.request.contextPath}/img/checkmark.png" style="width: 71px; border-radius: 43px; margin-left: auto; margin-right: auto; display: block;">
		</p>
		<h1 style="text-align: center;">주문완료</h1>
		<br />
		<main id="app"> <router-view></router-view> </main>
	</div>
	<template id="product">
	<div>
		<h2>{{ product.name }}</h2>
		<b>Description: </b>
		<div>{{ product.description }}</div>
		<b>Price:</b>
		<div>
			{{ product.price }}<span class="glyphicon glyphicon-euro"></span>
		</div>
		<br /> <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> <a><router-link to="/">Back to product list</router-link></a>
	</div>
	</template>
	<template id="product-list">
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Description</th>
					<!--       <th>Price</th>
      <th class="col-sm-2">Actions</th> -->
				</tr>
			</thead>
			<tbody>
				<tr v-for="product in filteredProducts">
					<!-- tr v-for="product in products" -->
					<!-- tr v-for="product in products | filterBy searchKey in 'name'" -->
					<td>반성문</td>
					<td>TOTAL : 8000원</td>
				</tr>
			</tbody>
		</table>
	</div>
	</template>
	<template id="add-product">
	<div>
		<h2>Add new product</h2>
		<form v-on:submit="createProduct">
			<div class="form-group">
				<label for="add-name">Name</label> <input class="form-control" id="add-name" v-model="product.name" required />
			</div>
			<div class="form-group">
				<label for="add-description">Description</label>
				<textarea class="form-control" id="add-description" rows="10" v-model="product.description"></textarea>
			</div>
			<div class="form-group">
				<label for="add-price">Price, <span class="glyphicon glyphicon-euro"></span></label> <input type="number" class="form-control" id="add-price" v-model="product.price" />
			</div>
			<button type="submit" class="btn btn-primary">Create</button>
			<a class="btn btn-default"><router-link to="/">Cancel</router-link></a>
		</form>
	</div>
	</template>
</body>
</html>