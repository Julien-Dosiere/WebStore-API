<?php

namespace App\Controller;

use App\Entity\Product;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validator\ValidatorInterface;


class UploadFileController extends AbstractController
{
    public function __construct(ValidatorInterface $validator)
    {
        $this->validator = $validator;
    }

    public function __invoke(Request $request)
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

        $productId = $request->request->get('product_id');

        $manager = $this->getDoctrine()->getManager();

        $product = $manager->getRepository(Product::class)->find($productId);

        $fileName = '';

        if($product && $product->getImage() == null){
            $fileName = $this->_upload($request);
            $product->setImage($this->fileSaveDb);
            $manager->persist($product);
            $manager->flush();
        }

        return new Response($fileName);
    }

    public function _upload($request)
    {
        $emailConstraint = new Assert\File([
            'maxSize'=>'1000k',
            'mimeTypes'=>["image/jpeg", "image/png"]]);

        $errors = $this->validator->validate(
            $request->files->get('imageFile'),
            $emailConstraint
        );

        if(0 === count($errors)){

        } else {
            $errorMessage = $errors[0]->getMessage();
            return new Response($errorMessage);
        }
        $uploadedFile = $request->files->get('imageFile');
        if(!$uploadedFile)
        {
            throw new BadRequestHttpException('"file" is required');
        }

        $originalFilename = pathinfo($uploadedFile->getClientOriginalName(), PATHINFO_FILENAME);

        $safeFilename = transliterator_transliterate('Any-Latin; Latin-ASCII; [^A-Za-z0-9_] remove; Lower()', $originalFilename);

        $filename = $safeFilename.'-'.uniqid().'.'.$uploadedFile->guessExtension();
        try{
            $uploadedFile ->move('uploads/images/products', $this->fileSaveDb = $originalFilename.'.'.$uploadedFile->guessExtension());
        } catch(FileException $exception){
            return;
        }

        return $filename;
    }
}
